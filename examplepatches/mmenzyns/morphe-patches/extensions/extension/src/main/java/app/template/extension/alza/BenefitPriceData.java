package app.template.extension.alza;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Data model and discount calculator for Alza Benefit Prices (Gold, Silver, ISIC, Bronze, B2B, Basic).
 */
public class BenefitPriceData implements Serializable {

    public enum TierType {
        GOLD("gold", "GOLD", "p_pg4_e6c95", 0xFFFFD500, 0xFF171717, 1, false),
        SILVER("silver", "SILVER", "p_pg3_36eef", 0xFFC2C2C2, 0xFF171717, 2, false),
        ISIC("isic", "ISIC", "p_pg3is1_2b2fc", 0xFF3CBA9C, 0xFFFFFFFF, 3, false),
        BRONZE("bronze", "BRONZE", "p_pg5_44266", 0xFFD2822D, 0xFFFFFFFF, 4, false),
        B2B("b2b", "B2B", "p_pg6_6ce49", 0xFF3A349F, 0xFFFFFFFF, 5, false),
        BASIC("basic", "BASIC", "p__26752", 0xFF333333, 0xFFE5E7EB, 6, true);

        public final String key;
        public final String displayName;
        public final String pgrik;
        public final int defaultBgColor;
        public final int defaultTextColor;
        public final int order;
        public final boolean reference;

        TierType(String key, String displayName, String pgrik, int defaultBgColor, int defaultTextColor, int order, boolean reference) {
            this.key = key;
            this.displayName = displayName;
            this.pgrik = pgrik;
            this.defaultBgColor = defaultBgColor;
            this.defaultTextColor = defaultTextColor;
            this.order = order;
            this.reference = reference;
        }

        public int getBgColor(boolean dark) {
            if (this == BASIC) {
                return dark ? 0xFF333333 : 0xFFF0F0F0;
            }
            return defaultBgColor;
        }

        public int getTextColor(boolean dark) {
            if (this == BASIC) {
                return dark ? 0xFFE5E7EB : 0xFF606060;
            }
            return defaultTextColor;
        }
    }

    public enum PromoType {
        NONE,
        ALZA_PLUS,    // priceType == 4
        CASHBACK,     // priceType == 1
        TRADE_IN,     // priceType == 2 (Výkupní bonus)
        COUPON        // discountCouponCode != null && !isEmpty()
    }

    public static class PromoItem implements Serializable {
        public final int priceType;
        public final String name;
        public final String discountCouponCode;
        public final String primaryPrice;
        public final double amount;
        public final PromoType promoType;

        public PromoItem(int priceType, String name, String discountCouponCode, String primaryPrice, double amount) {
            this.priceType = priceType;
            this.name = name;
            this.discountCouponCode = discountCouponCode;
            this.primaryPrice = primaryPrice;
            this.amount = amount;

            if (discountCouponCode != null && !discountCouponCode.trim().isEmpty()) {
                this.promoType = PromoType.COUPON;
            } else if (priceType == 4) {
                this.promoType = PromoType.ALZA_PLUS;
            } else if (priceType == 1) {
                this.promoType = PromoType.CASHBACK;
            } else if (priceType == 2) {
                this.promoType = PromoType.TRADE_IN;
            } else {
                this.promoType = PromoType.NONE;
            }
        }
    }

    public static class TierResult implements Serializable {
        public final TierType tier;
        public final String rawPrimaryPrice;
        public final double mainAmount;
        public final Double comparePrice;
        public final String comparePriceString;
        public final int priceType;
        public final int priceGroupType;
        public final boolean hidden;
        public final String source; // "api" or "inferred"
        public final List<PromoItem> promoPrices;

        // Computed dynamic fields (based on user promo filters)
        public double finalAmount;
        public String finalPriceFormatted;
        public PromoItem selectedPromo;
        public Double discountPercent;
        public Double discountBase;

        public TierResult(
                TierType tier,
                String rawPrimaryPrice,
                double mainAmount,
                Double comparePrice,
                String comparePriceString,
                int priceType,
                int priceGroupType,
                boolean hidden,
                String source,
                List<PromoItem> promoPrices
        ) {
            this.tier = tier;
            this.rawPrimaryPrice = rawPrimaryPrice;
            this.mainAmount = mainAmount;
            this.comparePrice = comparePrice;
            this.comparePriceString = comparePriceString;
            this.priceType = priceType;
            this.priceGroupType = priceGroupType;
            this.hidden = hidden;
            this.source = source != null ? source : "api";
            this.promoPrices = promoPrices != null ? promoPrices : new ArrayList<PromoItem>();
            this.finalAmount = mainAmount;
        }

        public TierResult copyForTier(TierType newTier, String newSource) {
            TierResult res = new TierResult(
                    newTier,
                    this.rawPrimaryPrice,
                    this.mainAmount,
                    this.comparePrice,
                    this.comparePriceString,
                    this.priceType,
                    this.priceGroupType,
                    this.hidden,
                    newSource,
                    new ArrayList<>(this.promoPrices)
            );
            res.finalAmount = this.finalAmount;
            res.finalPriceFormatted = this.finalPriceFormatted;
            res.selectedPromo = this.selectedPromo;
            res.discountPercent = this.discountPercent;
            res.discountBase = this.discountBase;
            return res;
        }
    }

    private final String commodityId;
    private final String country;
    private final String currency;
    private final long timestamp;
    private final Map<TierType, TierResult> tiers = new EnumMap<>(TierType.class);

    private double lowestPrice = 0.0;
    private TierType lowestPriceTier = null;
    private Double maxDiscountPercent = null;
    private boolean hasAnyPromo = false;
    private boolean hasAlzaPlusPromo = false;
    private boolean hasCashbackPromo = false;
    private boolean hasTradeInPromo = false;

    public BenefitPriceData(String commodityId, String country, String currency) {
        this.commodityId = commodityId;
        this.country = country != null ? country.toUpperCase(Locale.ROOT) : "CZ";
        this.currency = currency != null ? currency : ("SK".equalsIgnoreCase(this.country) ? "€" : "Kč");
        this.timestamp = System.currentTimeMillis();
    }

    public void addTierResult(TierResult result) {
        if (result != null && result.tier != null) {
            tiers.put(result.tier, result);
        }
    }

    public TierResult getTier(TierType tier) {
        return tiers.get(tier);
    }

    public Map<TierType, TierResult> getAllTiers() {
        return Collections.unmodifiableMap(tiers);
    }

    public String getCommodityId() {
        return commodityId;
    }

    public String getCountry() {
        return country;
    }

    public String getCurrency() {
        return currency;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public double getLowestPrice() {
        return lowestPrice;
    }

    public TierType getLowestPriceTier() {
        return lowestPriceTier;
    }

    public Double getMaxDiscountPercent() {
        return maxDiscountPercent;
    }

    public boolean hasAnyPromo() {
        return hasAnyPromo;
    }

    public boolean hasAlzaPlusPromo() {
        return hasAlzaPlusPromo;
    }

    public boolean hasCashbackPromo() {
        return hasCashbackPromo;
    }

    public boolean hasTradeInPromo() {
        return hasTradeInPromo;
    }

    /**
     * Recomputes final prices, selected promos, ISIC cashback correction,
     * and discounts according to active user promo toggles.
     */
    public void recompute(boolean enableAlzaPlus, boolean enableCashback, boolean enableTradeIn) {
        hasAnyPromo = false;
        hasAlzaPlusPromo = false;
        hasCashbackPromo = false;
        hasTradeInPromo = false;

        // 1. Select best candidate price for each tier
        for (TierResult tr : tiers.values()) {
            double candidateAmount = tr.mainAmount;
            PromoItem candidatePromo = null;

            for (PromoItem p : tr.promoPrices) {
                hasAnyPromo = true;
                if (p.promoType == PromoType.ALZA_PLUS) hasAlzaPlusPromo = true;
                if (p.promoType == PromoType.CASHBACK) hasCashbackPromo = true;
                if (p.promoType == PromoType.TRADE_IN) hasTradeInPromo = true;

                if (p.promoType == PromoType.ALZA_PLUS && !enableAlzaPlus) continue;
                if (p.promoType == PromoType.CASHBACK && !enableCashback) continue;
                if (p.promoType == PromoType.TRADE_IN && !enableTradeIn) continue;

                if (p.amount > 0 && p.amount < candidateAmount) {
                    candidateAmount = p.amount;
                    candidatePromo = p;
                }
            }

            tr.finalAmount = candidateAmount;
            tr.selectedPromo = candidatePromo;
        }

        // 2. ISIC Cashback Correction (Section 2.C.5)
        TierResult isic = tiers.get(TierType.ISIC);
        TierResult basic = tiers.get(TierType.BASIC);
        if (isic != null && basic != null
                && isic.selectedPromo != null && isic.selectedPromo.promoType == PromoType.CASHBACK
                && basic.selectedPromo != null && basic.selectedPromo.promoType == PromoType.CASHBACK
                && Math.abs(isic.finalAmount - basic.finalAmount) < 0.01
                && isic.mainAmount < basic.mainAmount) {
            double cashbackAmount = basic.mainAmount - basic.finalAmount;
            double raw = isic.mainAmount - cashbackAmount;
            if (raw > 0) {
                if ("SK".equalsIgnoreCase(country)) {
                    raw = Math.round(raw * 100.0) / 100.0;
                } else {
                    raw = Math.round(raw);
                }
                isic.finalAmount = raw;
            }
        }

        // 3. Discount calculation & formatting for each tier
        lowestPrice = Double.MAX_VALUE;
        lowestPriceTier = null;
        maxDiscountPercent = null;

        for (TierResult tr : tiers.values()) {
            tr.finalPriceFormatted = formatPrice(tr.finalAmount);

            double discountBase = 0.0;
            if (tr.comparePrice != null && tr.comparePrice > tr.finalAmount) {
                discountBase = tr.comparePrice;
            } else if (tr.selectedPromo != null && tr.mainAmount > tr.finalAmount) {
                discountBase = tr.mainAmount;
            } else if (!tr.tier.reference && basic != null && basic.finalAmount > tr.finalAmount) {
                discountBase = basic.finalAmount;
            }

            tr.discountBase = (discountBase > 0) ? discountBase : null;
            if (discountBase > tr.finalAmount && discountBase > 0) {
                double pct = (discountBase - tr.finalAmount) / discountBase * 100.0;
                tr.discountPercent = pct;
                if (maxDiscountPercent == null || pct > maxDiscountPercent) {
                    maxDiscountPercent = pct;
                }
            } else {
                tr.discountPercent = null;
            }

            if (tr.finalAmount > 0 && tr.finalAmount < lowestPrice) {
                lowestPrice = tr.finalAmount;
                lowestPriceTier = tr.tier;
            }
        }

        if (lowestPrice == Double.MAX_VALUE) {
            lowestPrice = 0.0;
        }
    }

    /**
     * Formats price according to currency and region.
     */
    public String formatPrice(double price) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator(' ');
        symbols.setDecimalSeparator(',');

        if ("€".equals(currency) || "SK".equalsIgnoreCase(country)) {
            if (price == Math.floor(price)) {
                return new DecimalFormat("#,##0", symbols).format(price) + " €";
            } else {
                return new DecimalFormat("#,##0.00", symbols).format(price) + " €";
            }
        }
        return new DecimalFormat("#,###", symbols).format(price) + " Kč";
    }

    /**
     * Group of tiers that share identical price and promo action.
     */
    public static class TierGroup implements Serializable {
        public final List<TierResult> items = new ArrayList<>();
        public boolean isOtherSummary = false;

        public double getFinalAmount() {
            return items.isEmpty() ? 0.0 : items.get(0).finalAmount;
        }

        public Double getDiscountPercent() {
            return items.isEmpty() ? null : items.get(0).discountPercent;
        }

        public Double getDiscountBase() {
            return items.isEmpty() ? null : items.get(0).discountBase;
        }

        public PromoItem getSelectedPromo() {
            return items.isEmpty() ? null : items.get(0).selectedPromo;
        }

        public String getFinalPriceFormatted() {
            return items.isEmpty() ? "" : items.get(0).finalPriceFormatted;
        }

        public Double getComparePrice() {
            for (TierResult tr : items) {
                if (tr.comparePrice != null && tr.comparePrice > tr.finalAmount) {
                    return tr.comparePrice;
                }
            }
            return null;
        }

        public boolean hasBasic() {
            for (TierResult tr : items) {
                if (tr.tier == TierType.BASIC) return true;
            }
            return false;
        }
    }

    public static boolean isSamePromo(PromoItem p1, PromoItem p2) {
        if (p1 == null && p2 == null) return true;
        if (p1 == null || p2 == null) return false;
        if (p1.promoType != p2.promoType) return false;
        if (Math.abs(p1.amount - p2.amount) >= 0.01) return false;
        String c1 = p1.discountCouponCode != null ? p1.discountCouponCode : "";
        String c2 = p2.discountCouponCode != null ? p2.discountCouponCode : "";
        return c1.equals(c2);
    }

    public boolean areAllPricesEqual() {
        if (tiers.size() < 2) return false;
        TierResult first = null;
        for (TierResult tr : tiers.values()) {
            if (first == null) {
                first = tr;
                continue;
            }
            if (Math.abs(tr.finalAmount - first.finalAmount) >= 0.01) {
                return false;
            }
            if (!isSamePromo(tr.selectedPromo, first.selectedPromo)) {
                return false;
            }
        }
        return true;
    }

    public boolean isAnyTierCheaperThanBasic() {
        TierResult basic = tiers.get(TierType.BASIC);
        if (basic == null) return false;
        for (TierResult tr : tiers.values()) {
            if (tr.tier != TierType.BASIC && tr.finalAmount < basic.finalAmount - 0.01) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns grouped display rows according to Section 4 specification:
     * - Sorted by finalAmount ascending, then tier order
     * - Consecutive tiers with same price & promo merged into TierGroup
     * - 3 or more tiers matching BASIC grouped as "OSTATNÍ"
     */
    public List<TierGroup> getGroupedDisplayRows() {
        List<TierResult> sorted = new ArrayList<>(tiers.values());
        Collections.sort(sorted, new Comparator<TierResult>() {
            @Override
            public int compare(TierResult o1, TierResult o2) {
                int cmp = Double.compare(o1.finalAmount, o2.finalAmount);
                if (cmp != 0) return cmp;
                return Integer.compare(o1.tier.order, o2.tier.order);
            }
        });

        List<TierGroup> groups = new ArrayList<>();
        for (TierResult tr : sorted) {
            if (groups.isEmpty()) {
                TierGroup tg = new TierGroup();
                tg.items.add(tr);
                groups.add(tg);
            } else {
                TierGroup last = groups.get(groups.size() - 1);
                TierResult prev = last.items.get(0);
                if (Math.abs(tr.finalAmount - prev.finalAmount) < 0.01 && isSamePromo(tr.selectedPromo, prev.selectedPromo)) {
                    last.items.add(tr);
                } else {
                    TierGroup tg = new TierGroup();
                    tg.items.add(tr);
                    groups.add(tg);
                }
            }
        }

        TierResult basic = tiers.get(TierType.BASIC);
        if (basic != null) {
            for (TierGroup g : groups) {
                if (g.hasBasic() && g.items.size() >= 3) {
                    g.isOtherSummary = true;
                }
            }
        }

        return groups;
    }

    /**
     * Returns rows for display sorted by final price ascending.
     * If alwaysShow is false, filters out non-discounted tiers that match Basic.
     */
    public List<TierResult> getDisplayRows(boolean alwaysShow) {
        List<TierResult> list = new ArrayList<>(tiers.values());
        Collections.sort(list, new Comparator<TierResult>() {
            @Override
            public int compare(TierResult o1, TierResult o2) {
                int cmp = Double.compare(o1.finalAmount, o2.finalAmount);
                if (cmp != 0) return cmp;
                return Integer.compare(o1.tier.order, o2.tier.order);
            }
        });

        if (alwaysShow) {
            return list;
        }

        // Filter: keep basic and any tier with a discount or cheaper than basic
        TierResult basic = tiers.get(TierType.BASIC);
        double basicPrice = (basic != null) ? basic.finalAmount : Double.MAX_VALUE;

        List<TierResult> filtered = new ArrayList<>();
        for (TierResult tr : list) {
            if (tr.tier.reference || (tr.discountPercent != null && tr.discountPercent >= 0.5) || tr.finalAmount < basicPrice) {
                filtered.add(tr);
            }
        }
        return filtered.isEmpty() ? list : filtered;
    }
}

