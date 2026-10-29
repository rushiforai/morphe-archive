package app.pielm.extension.twitter.gif;

/**
 * NeuQuant Neural-Net Quantization Algorithm (Anthony Dekker, 1994).
 * Adapted for fast 256-color GIF palette quantization on Android.
 */
final class NeuQuant {
    private static final int NETSIZE = 256;
    private static final int PRIME1 = 499;
    private static final int PRIME2 = 491;
    private static final int PRIME3 = 487;
    private static final int PRIME4 = 503;
    private static final int MINPICTUREBYTES = (3 * PRIME4);
    private static final int MAXNETPOS = (NETSIZE - 1);
    private static final int NETBIASSSHIFT = 4;
    private static final int NCYCLES = 100;

    private static final int INTBIASSSHIFT = 16;
    private static final int INTBIAS = (1 << INTBIASSSHIFT);
    private static final int GAMMASHIFT = 10;
    private static final int BETASHIFT = 10;
    private static final int BETA = (INTBIAS >> BETASHIFT);
    private static final int BETAGAMMA = (INTBIAS << (GAMMASHIFT - BETASHIFT));

    private static final int INITRAD = (NETSIZE >> 3);
    private static final int RADIUSBIASSSHIFT = 6;
    private static final int RADIUSBIAS = (1 << RADIUSBIASSSHIFT);
    private static final int INITRADIUS = (INITRAD * RADIUSBIAS);
    private static final int RADIUSDELTA = 30;

    private static final int ALPHABIASSSHIFT = 10;
    private static final int INITALPHA = (1 << ALPHABIASSSHIFT);

    private static final int RADBIASSSHIFT = 8;
    private static final int RADBIAS = (1 << RADBIASSSHIFT);
    private static final int ALPHARADBSHIFT = (ALPHABIASSSHIFT + RADBIASSSHIFT);
    private static final int ALPHARADBIAS = (1 << ALPHARADBSHIFT);

    private final byte[] thepicture;
    private final int lengthcount;
    private int samplefac;

    private final int[][] network;
    private final int[] netindex = new int[256];
    private final int[] bias = new int[NETSIZE];
    private final int[] freq = new int[NETSIZE];
    private final int[] radpower = new int[INITRAD];

    NeuQuant(byte[] thepic, int len, int sample) {
        thepicture = thepic;
        lengthcount = len;
        samplefac = sample;

        network = new int[NETSIZE][];
        for (int i = 0; i < NETSIZE; i++) {
            network[i] = new int[4];
            int[] p = network[i];
            p[0] = p[1] = p[2] = (i << (NETBIASSSHIFT + 8)) / NETSIZE;
            freq[i] = INTBIAS / NETSIZE;
            bias[i] = 0;
        }
    }

    byte[] colorMap() {
        byte[] map = new byte[3 * NETSIZE];
        int[] index = new int[NETSIZE];
        for (int i = 0; i < NETSIZE; i++) {
            index[network[i][3]] = i;
        }
        int k = 0;
        for (int i = 0; i < NETSIZE; i++) {
            int j = index[i];
            map[k++] = (byte) (network[j][0]);
            map[k++] = (byte) (network[j][1]);
            map[k++] = (byte) (network[j][2]);
        }
        return map;
    }

    void inxbuild() {
        int previouscol = 0;
        int startpos = 0;
        for (int i = 0; i < NETSIZE; i++) {
            int[] p = network[i];
            int smallpos = i;
            int smallval = p[1];
            for (int j = i + 1; j < NETSIZE; j++) {
                int[] q = network[j];
                if (q[1] < smallval) {
                    smallpos = j;
                    smallval = q[1];
                }
            }
            int[] q = network[smallpos];
            if (i != smallpos) {
                int j = q[0];
                q[0] = p[0];
                p[0] = j;
                j = q[1];
                q[1] = p[1];
                p[1] = j;
                j = q[2];
                q[2] = p[2];
                p[2] = j;
                j = q[3];
                q[3] = p[3];
                p[3] = j;
            }
            if (smallval != previouscol) {
                netindex[previouscol] = (startpos + i) >> 1;
                for (int j = previouscol + 1; j < smallval; j++) {
                    netindex[j] = i;
                }
                previouscol = smallval;
                startpos = i;
            }
        }
        netindex[previouscol] = (startpos + MAXNETPOS) >> 1;
        for (int j = previouscol + 1; j < 256; j++) {
            netindex[j] = MAXNETPOS;
        }
    }

    void learn() {
        if (lengthcount < MINPICTUREBYTES) {
            samplefac = 1;
        }
        int alphadec = 30 + ((samplefac - 1) / 3);
        byte[] p = thepicture;
        int pix = 0;
        int lim = lengthcount;
        int samplepixels = lengthcount / (3 * samplefac);
        int delta = samplepixels / NCYCLES;
        int alpha = INITALPHA;
        int radius = INITRADIUS;

        int rad = radius >> RADIUSBIASSSHIFT;
        if (rad <= 1) {
            rad = 0;
        }
        for (int i = 0; i < rad; i++) {
            radpower[i] = alpha * (((rad * rad - i * i) * RADBIAS) / (rad * rad));
        }

        int step;
        if (lengthcount < MINPICTUREBYTES) {
            step = 3;
        } else if ((lengthcount % PRIME1) != 0) {
            step = 3 * PRIME1;
        } else if ((lengthcount % PRIME2) != 0) {
            step = 3 * PRIME2;
        } else if ((lengthcount % PRIME3) != 0) {
            step = 3 * PRIME3;
        } else {
            step = 3 * PRIME4;
        }

        int i = 0;
        while (i < samplepixels) {
            int b = (p[pix] & 0xff) << NETBIASSSHIFT;
            int g = (p[pix + 1] & 0xff) << NETBIASSSHIFT;
            int r = (p[pix + 2] & 0xff) << NETBIASSSHIFT;
            int j = contest(b, g, r);

            altersingle(alpha, j, b, g, r);
            if (rad != 0) {
                alterneigh(rad, j, b, g, r);
            }

            pix += step;
            if (pix >= lim) {
                pix -= lengthcount;
            }

            i++;
            if (delta == 0) {
                delta = 1;
            }
            if (i % delta == 0) {
                alpha -= alpha / alphadec;
                radius -= radius / RADIUSDELTA;
                rad = radius >> RADIUSBIASSSHIFT;
                if (rad <= 1) {
                    rad = 0;
                }
                for (j = 0; j < rad; j++) {
                    radpower[j] = alpha * (((rad * rad - j * j) * RADBIAS) / (rad * rad));
                }
            }
        }
    }

    int map(int b, int g, int r) {
        int bestd = 1000;
        int best = -1;
        int i = netindex[g];
        int j = i - 1;

        while ((i < NETSIZE) || (j >= 0)) {
            if (i < NETSIZE) {
                int[] p = network[i];
                int dist = p[1] - g;
                if (dist >= bestd) {
                    i = NETSIZE;
                } else {
                    i++;
                    if (dist < 0) {
                        dist = -dist;
                    }
                    int a = p[0] - b;
                    if (a < 0) {
                        a = -a;
                    }
                    dist += a;
                    if (dist < bestd) {
                        a = p[2] - r;
                        if (a < 0) {
                            a = -a;
                        }
                        dist += a;
                        if (dist < bestd) {
                            bestd = dist;
                            best = p[3];
                        }
                    }
                }
            }
            if (j >= 0) {
                int[] p = network[j];
                int dist = g - p[1];
                if (dist >= bestd) {
                    j = -1;
                } else {
                    j--;
                    if (dist < 0) {
                        dist = -dist;
                    }
                    int a = p[0] - b;
                    if (a < 0) {
                        a = -a;
                    }
                    dist += a;
                    if (dist < bestd) {
                        a = p[2] - r;
                        if (a < 0) {
                            a = -a;
                        }
                        dist += a;
                        if (dist < bestd) {
                            bestd = dist;
                            best = p[3];
                        }
                    }
                }
            }
        }
        return best;
    }

    byte[] process() {
        learn();
        unbiasnet();
        inxbuild();
        return colorMap();
    }

    private void unbiasnet() {
        for (int i = 0; i < NETSIZE; i++) {
            network[i][0] >>= NETBIASSSHIFT;
            network[i][1] >>= NETBIASSSHIFT;
            network[i][2] >>= NETBIASSSHIFT;
            network[i][3] = i;
        }
    }

    private void alterneigh(int rad, int i, int b, int g, int r) {
        int lo = i - rad;
        if (lo < -1) {
            lo = -1;
        }
        int hi = i + rad;
        if (hi > NETSIZE) {
            hi = NETSIZE;
        }

        int j = i + 1;
        int k = i - 1;
        int m = 1;
        while ((j < hi) || (k > lo)) {
            int a = radpower[m++];
            if (j < hi) {
                int[] p = network[j++];
                p[0] -= (a * (p[0] - b)) / ALPHARADBIAS;
                p[1] -= (a * (p[1] - g)) / ALPHARADBIAS;
                p[2] -= (a * (p[2] - r)) / ALPHARADBIAS;
            }
            if (k > lo) {
                int[] p = network[k--];
                p[0] -= (a * (p[0] - b)) / ALPHARADBIAS;
                p[1] -= (a * (p[1] - g)) / ALPHARADBIAS;
                p[2] -= (a * (p[2] - r)) / ALPHARADBIAS;
            }
        }
    }

    private void altersingle(int alpha, int i, int b, int g, int r) {
        int[] n = network[i];
        n[0] -= (alpha * (n[0] - b)) / INITALPHA;
        n[1] -= (alpha * (n[1] - g)) / INITALPHA;
        n[2] -= (alpha * (n[2] - r)) / INITALPHA;
    }

    private int contest(int b, int g, int r) {
        int bestd = ~(1 << 31);
        int bestbiasd = bestd;
        int bestpos = -1;
        int bestbiaspos = bestpos;

        for (int i = 0; i < NETSIZE; i++) {
            int[] n = network[i];
            int dist = n[0] - b;
            if (dist < 0) {
                dist = -dist;
            }
            int a = n[1] - g;
            if (a < 0) {
                a = -a;
            }
            dist += a;
            a = n[2] - r;
            if (a < 0) {
                a = -a;
            }
            dist += a;
            if (dist < bestd) {
                bestd = dist;
                bestpos = i;
            }
            int biasdist = dist - ((bias[i]) >> (INTBIASSSHIFT - NETBIASSSHIFT));
            if (biasdist < bestbiasd) {
                bestbiasd = biasdist;
                bestbiaspos = i;
            }
            int betafreq = (freq[i] >> BETASHIFT);
            freq[i] -= betafreq;
            bias[i] += (betafreq << GAMMASHIFT);
        }
        freq[bestpos] += BETA;
        bias[bestpos] -= BETAGAMMA;
        return bestbiaspos;
    }
}
