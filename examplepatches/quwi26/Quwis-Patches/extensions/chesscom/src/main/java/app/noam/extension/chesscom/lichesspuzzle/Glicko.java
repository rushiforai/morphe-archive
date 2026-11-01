package app.noam.extension.chesscom.lichesspuzzle;

/**
 * The puzzle rating, Glicko-2 as Lichess rates puzzles (start 1500, deviation 500, volatility
 * 0.09, tau 0.75, deviation kept within 45..500). Each puzzle is one game against its rating.
 * Follows Glickman's "Example of the Glicko-2 system".
 */
final class Glicko {
    private static final double SCALE = 173.7178;
    private static final double TAU = 0.75;
    private static final double EPSILON = 0.000001;
    /** Lichess's puzzle packs carry no deviation; a settled puzzle rating. */
    private static final double PUZZLE_DEVIATION = 75;

    final double rating;
    final double deviation;
    final double volatility;

    Glicko(double rating, double deviation, double volatility) {
        this.rating = rating;
        this.deviation = deviation;
        this.volatility = volatility;
    }

    static Glicko start() {
        return new Glicko(1500, 500, 0.09);
    }

    /** The rating after one puzzle of the given rating: score 1 solved, 0 failed. */
    Glicko after(double puzzleRating, double score) {
        double mu = (rating - 1500) / SCALE;
        double phi = deviation / SCALE;
        double muJ = (puzzleRating - 1500) / SCALE;
        double phiJ = PUZZLE_DEVIATION / SCALE;

        double g = 1 / Math.sqrt(1 + 3 * phiJ * phiJ / (Math.PI * Math.PI));
        double e = 1 / (1 + Math.exp(-g * (mu - muJ)));
        double v = 1 / (g * g * e * (1 - e));
        double delta = v * g * (score - e);

        // The new volatility, by the Illinois algorithm.
        double a = Math.log(volatility * volatility);
        double A = a;
        double B;
        if (delta * delta > phi * phi + v) {
            B = Math.log(delta * delta - phi * phi - v);
        } else {
            int k = 1;
            while (f(a - k * TAU, delta, phi, v, a) < 0) k++;
            B = a - k * TAU;
        }
        double fA = f(A, delta, phi, v, a), fB = f(B, delta, phi, v, a);
        while (Math.abs(B - A) > EPSILON) {
            double C = A + (A - B) * fA / (fB - fA);
            double fC = f(C, delta, phi, v, a);
            if (fC * fB <= 0) {
                A = B;
                fA = fB;
            } else {
                fA /= 2;
            }
            B = C;
            fB = fC;
        }
        double newVolatility = Math.exp(A / 2);

        double phiStar = Math.sqrt(phi * phi + newVolatility * newVolatility);
        double newPhi = 1 / Math.sqrt(1 / (phiStar * phiStar) + 1 / v);
        double newMu = mu + newPhi * newPhi * g * (score - e);
        double newDeviation = Math.max(45, Math.min(500, newPhi * SCALE));
        return new Glicko(newMu * SCALE + 1500, newDeviation, newVolatility);
    }

    private static double f(double x, double delta, double phi, double v, double a) {
        double ex = Math.exp(x);
        double d = phi * phi + v + ex;
        return ex * (delta * delta - d) / (2 * d * d) - (x - a) / (TAU * TAU);
    }
}
