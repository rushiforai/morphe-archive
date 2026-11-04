package app.template.extension.alza;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PriceHistoryData implements Serializable {
    public static class PricePoint implements Serializable {
        public final long timestamp;
        public final double price;

        public PricePoint(long timestamp, double price) {
            this.timestamp = timestamp;
            this.price = price;
        }
    }

    private final String commodityId;
    private final String productName;
    private final String identifier; // EAN or Part Number
    private final Double currentPrice;
    private final Double commonPrice; // Omnibus 30-day reference price before discount
    private final Double minPrice;
    private final Double maxPrice;
    private final Double realDiscount;
    private final Double claimedDiscount;
    private final List<PricePoint> currentPricePoints;
    private final List<PricePoint> originalPricePoints;
    private volatile DiscountCalculation cachedDiscountCalculation = null;

    public PriceHistoryData(
            String commodityId,
            String productName,
            String identifier,
            Double currentPrice,
            Double commonPrice,
            Double minPrice,
            Double maxPrice,
            Double realDiscount,
            Double claimedDiscount,
            List<PricePoint> currentPricePoints,
            List<PricePoint> originalPricePoints
    ) {
        this.commodityId = commodityId;
        this.productName = productName;
        this.identifier = identifier;
        this.currentPrice = currentPrice;
        this.commonPrice = commonPrice;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.realDiscount = realDiscount;
        this.claimedDiscount = claimedDiscount;
        this.currentPricePoints = currentPricePoints != null ? currentPricePoints : new ArrayList<PricePoint>();
        this.originalPricePoints = originalPricePoints != null ? originalPricePoints : new ArrayList<PricePoint>();
    }

    public String getCommodityId() {
        return commodityId;
    }

    public String getProductName() {
        return productName;
    }

    public String getIdentifier() {
        return identifier;
    }

    public Double getCurrentPrice() {
        return currentPrice;
    }

    public Double getCommonPrice() {
        return commonPrice;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public Double getRealDiscount() {
        return realDiscount;
    }

    public Double getClaimedDiscount() {
        return claimedDiscount;
    }

    public List<PricePoint> getCurrentPricePoints() {
        return Collections.unmodifiableList(currentPricePoints);
    }

    public List<PricePoint> getOriginalPricePoints() {
        return Collections.unmodifiableList(originalPricePoints);
    }

    public static class DiscountCalculation implements Serializable {
        public final Double realDiscountPercent; // e.g. 18.0
        public final Double referencePrice;      // e.g. 1490.0
        public final String methodologyNote;     // e.g. "podle nejnižší ceny za 30 dní před slevou"

        public DiscountCalculation(Double realDiscountPercent, Double referencePrice, String methodologyNote) {
            this.realDiscountPercent = realDiscountPercent;
            this.referencePrice = referencePrice;
            this.methodologyNote = methodologyNote;
        }
    }

    public boolean hasData() {
        return !currentPricePoints.isEmpty();
    }

    /**
     * Calculates real discount according to exact Hlídač shopů methodology:
     * 1. Continuous price decrease <= 180 days:
     *    Lowest price in 30 days prior to the start of the discount campaign.
     * 2. Continuous progressive decrease (postupné zlevňování, max 180 days back):
     *    Lowest price in 30 days prior to the first discount in the series.
     * 3. Price moved up OR discount older than 180 days (tržní korekce):
     *    Common price (modus / most frequent price over last 90 days).
     */
    public DiscountCalculation calculateHlidacShopuDiscount() {
        if (cachedDiscountCalculation != null) {
            return cachedDiscountCalculation;
        }
        DiscountCalculation calc = doCalculateHlidacShopuDiscount();
        cachedDiscountCalculation = calc;
        return calc;
    }

    private DiscountCalculation doCalculateHlidacShopuDiscount() {
        // 1. Prefer authoritative realDiscount directly from Hlídač shopů API
        if (realDiscount != null && realDiscount > 0) {
            double normalizedDiscount = (realDiscount <= 1.0) ? (realDiscount * 100.0) : realDiscount;
            double ref = (commonPrice != null && commonPrice > 0) ? commonPrice
                    : ((currentPrice != null && normalizedDiscount < 100) ? (currentPrice / (1.0 - normalizedDiscount / 100.0)) : (currentPrice != null ? currentPrice : 0.0));
            return new DiscountCalculation(normalizedDiscount, ref, "z Hlídače shopů");
        }

        if (currentPricePoints == null || currentPricePoints.size() < 2) {
            if (realDiscount != null && realDiscount >= 0) {
                double normalizedDiscount = (realDiscount <= 1.0 && realDiscount > 0) ? (realDiscount * 100.0) : realDiscount;
                return new DiscountCalculation(normalizedDiscount, commonPrice != null ? commonPrice : currentPrice, "z Hlídače shopů");
            }
            return new DiscountCalculation(0.0, currentPrice, "");
        }

        long now = System.currentTimeMillis();
        double curPrice = (currentPrice != null) ? currentPrice : currentPricePoints.get(currentPricePoints.size() - 1).price;

        int n = currentPricePoints.size();
        int idx = n - 1;
        while (idx >= 0 && Math.abs(currentPricePoints.get(idx).price - curPrice) < 0.01) {
            idx--;
        }

        if (idx < 0) {
            // Price was always identical
            return new DiscountCalculation(0.0, curPrice, "");
        }

        // Check if price moved up to reach curPrice
        boolean priceMovedUp = currentPricePoints.get(idx).price < curPrice;

        // Souvislé vícenásobné zlevňování (max 180 dní zpět)
        long maxDiscountWindow = 180L * 24 * 60 * 60 * 1000L;
        int firstDropIdx = idx;
        while (firstDropIdx > 0
                && currentPricePoints.get(firstDropIdx - 1).price > currentPricePoints.get(firstDropIdx).price
                && (now - currentPricePoints.get(firstDropIdx).timestamp) <= maxDiscountWindow) {
            firstDropIdx--;
        }

        // Safe indexing: prevent IndexOutOfBoundsException if firstDropIdx + 1 == n
        long discountStart = (firstDropIdx + 1 < n)
                ? currentPricePoints.get(firstDropIdx + 1).timestamp
                : currentPricePoints.get(firstDropIdx).timestamp;
        long discountAge = now - discountStart;

        if (!priceMovedUp && discountAge <= maxDiscountWindow) {
            // Metodika 1 + 2: Nejnižší cena za 30 dní před začátkem slevové akce
            long thirtyDaysBefore = discountStart - (30L * 24 * 60 * 60 * 1000L);
            double minBefore = Double.MAX_VALUE;
            for (int i = firstDropIdx; i >= 0; i--) {
                PricePoint pt = currentPricePoints.get(i);
                if (pt.price < minBefore) {
                    minBefore = pt.price;
                }
                if (pt.timestamp < thirtyDaysBefore) {
                    break;
                }
            }

            if (minBefore != Double.MAX_VALUE && minBefore > curPrice) {
                double discount = Math.round(((minBefore - curPrice) / minBefore) * 1000.0) / 10.0;
                return new DiscountCalculation(discount, minBefore, "podle nejnižší ceny za 30 dní před slevou");
            }

            // Metodika 2b: Kolísavá cena – pokud minBefore <= curPrice, ale referenční cena Hlídače shopů
            // nebo modus/běžná cena za 90 dní je vyšší než curPrice, použij ji jako referenci.
            if (commonPrice != null && commonPrice > curPrice) {
                double discount = Math.round(((commonPrice - curPrice) / commonPrice) * 1000.0) / 10.0;
                return new DiscountCalculation(discount, commonPrice, "podle referenční ceny Hlídače shopů");
            }

            double common90 = calculateCommonPriceOverWindow(currentPricePoints, now, 90L * 24 * 60 * 60 * 1000L, curPrice);
            if (common90 > curPrice) {
                double discount = Math.round(((common90 - curPrice) / common90) * 1000.0) / 10.0;
                return new DiscountCalculation(discount, common90, "podle běžné ceny za posledních 90 dní");
            }

            return new DiscountCalculation(0.0, (minBefore != Double.MAX_VALUE ? minBefore : curPrice), "podle nejnižší ceny za 30 dní před slevou");
        } else {
            // Metodika 3: Tržní korekce (sleva starší 180 dní nebo pohyb ceny nahoru)
            // Běžná cena = cena, za kterou se zboží prodávalo nejčastěji za posledních 90 dní
            double commonPriceCalc = calculateCommonPriceOverWindow(currentPricePoints, now, 90L * 24 * 60 * 60 * 1000L, curPrice);
            if (commonPrice != null && commonPrice > 0) {
                commonPriceCalc = commonPrice;
            }

            if (commonPriceCalc > curPrice) {
                double discount = Math.round(((commonPriceCalc - curPrice) / commonPriceCalc) * 1000.0) / 10.0;
                return new DiscountCalculation(discount, commonPriceCalc, "podle běžné ceny za posledních 90 dní");
            } else {
                return new DiscountCalculation(0.0, commonPriceCalc, "podle běžné ceny za posledních 90 dní");
            }
        }
    }

    private static double calculateCommonPriceOverWindow(List<PricePoint> points, long endTime, long windowDuration, double fallbackPrice) {
        if (points == null || points.isEmpty()) return fallbackPrice;
        long startTime = endTime - windowDuration;
        java.util.Map<Double, Long> priceDurations = new java.util.HashMap<Double, Long>();
        long lastTime = endTime;

        for (int i = points.size() - 1; i >= 0; i--) {
            PricePoint pt = points.get(i);
            long segStart = Math.max(pt.timestamp, startTime);
            long duration = lastTime - segStart;
            if (duration > 0) {
                Long d = priceDurations.get(pt.price);
                priceDurations.put(pt.price, (d != null ? d : 0L) + duration);
            }
            lastTime = segStart;
            if (pt.timestamp <= startTime) {
                break;
            }
        }

        double common = fallbackPrice;
        long maxDur = -1;
        for (java.util.Map.Entry<Double, Long> entry : priceDurations.entrySet()) {
            if (entry.getValue() > maxDur) {
                maxDur = entry.getValue();
                common = entry.getKey();
            }
        }
        return common;
    }

    public Double getEffectiveReferencePrice() {
        DiscountCalculation calc = calculateHlidacShopuDiscount();
        return calc != null ? calc.referencePrice : commonPrice;
    }

    public Double getEffectiveRealDiscount() {
        DiscountCalculation calc = calculateHlidacShopuDiscount();
        return calc != null ? calc.realDiscountPercent : realDiscount;
    }
}
