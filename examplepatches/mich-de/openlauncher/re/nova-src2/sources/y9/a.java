package y9;

/* loaded from: classes.dex */
public final class a implements nz.c {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f96860a = new float[2];

    /* renamed from: b, reason: collision with root package name */
    public float f96861b;

    /* renamed from: c, reason: collision with root package name */
    public float f96862c;

    /* renamed from: d, reason: collision with root package name */
    public float f96863d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f96864e;

    /* renamed from: f, reason: collision with root package name */
    public float f96865f;

    /* renamed from: g, reason: collision with root package name */
    public final int f96866g;

    public a(int i5) {
        this.f96866g = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x00c7 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:109:0x00ca A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x00e6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:128:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x00b3 A[RETURN] */
    @Override // nz.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(int i5, int i11, int i12) {
        int i13 = i11 % i12;
        int i14 = i11 / i12;
        int i15 = 3;
        int i16 = this.f96866g;
        if (i16 == 4) {
            if (i12 >= 3 && i5 == 3) {
                if (i11 != 1) {
                    if (i11 == 2) {
                    }
                }
            }
            if (i12 == 3 && i5 == 4) {
                if (i11 != 2) {
                    if (i11 == 3) {
                    }
                }
            }
            if (i12 >= 4 && i5 < i12 + 1) {
                if (i11 != 1) {
                    if (i11 == 2) {
                        return 1;
                    }
                    return i11;
                }
            }
            if (i12 >= 4 && i5 == i12 + 1) {
                if (i11 >= 2) {
                    if (i11 != i12) {
                        return i11 == 2 ? 3 : -1;
                    }
                }
                return i11;
            }
            if (i12 == 4 && i5 == 5) {
                if (i11 >= 2) {
                    if (i11 != 2) {
                        return i11 == 4 ? 2 : -1;
                    }
                }
                return i11;
            }
            if (i16 != 4) {
                i15 = 2;
            } else if (i12 == 2) {
                i15 = 4;
            }
            if (i13 >= i15 && i14 < i15) {
                return (i14 * i15) + i13;
            }
        }
        if (i12 == 2 && i5 > 4) {
            if (i11 != 0 && i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                    }
                }
            }
            return i11;
        }
        if (i12 >= 3 && i5 == 3) {
            if (i11 != 1) {
                if (i11 == 2) {
                }
            }
        }
        if (i12 >= 3 && i5 == 4) {
            if (i11 != 0) {
                if (i11 == 1) {
                    return 0;
                }
                if (i11 != 2) {
                    if (i11 == 3) {
                        if (i12 == 3) {
                        }
                    }
                    return i11;
                }
                if (i12 == 3) {
                }
            }
        }
        if (i12 == 4 && i5 == 5) {
            if (i11 != 3) {
                if (i11 == 4) {
                }
            }
            return 4;
        }
        if (i12 >= 5) {
            if (i5 <= i12) {
                if (i11 != 1) {
                    if (i11 != 2) {
                        if (i11 != 3) {
                            if (i11 == 4) {
                            }
                        }
                        return 4;
                    }
                }
                return 1;
            }
            if (i5 == 6) {
                if (i11 != 5) {
                    if (i11 != 3) {
                        if (i11 != 2) {
                            if (i11 == 4) {
                                return -1;
                            }
                        }
                        return 4;
                    }
                }
            }
            if (i11 != 0) {
                if (i11 == 1) {
                    return 0;
                }
                if (i11 != 2 || i12 != 5) {
                    if ((i11 != 3 || i12 != 5) && i11 != 2) {
                        if (i11 != 3) {
                            if (i11 != 4) {
                                if (i12 == 5) {
                                    if (i11 == 5) {
                                        return 6;
                                    }
                                    if (i11 == 6) {
                                        if (i5 >= 8) {
                                            return 7;
                                        }
                                    } else if (i11 == 7) {
                                        if (i5 > 8) {
                                            return 8;
                                        }
                                    } else if (i11 == 8) {
                                    }
                                    return 5;
                                }
                                if (i11 > 9) {
                                    return -1;
                                }
                                return i11;
                            }
                        }
                    }
                    return 4;
                }
                return 1;
            }
        }
        if (i16 != 4) {
        }
        return i13 >= i15 ? -1 : -1;
    }

    @Override // nz.c
    public final int b() {
        return this.f96866g;
    }

    @Override // nz.c
    public final void c(int i5, float f11, boolean z11) {
        if (i5 == 0) {
            throw new IllegalStateException("availableSpace must be > 0");
        }
        float f12 = i5;
        this.f96861b = f12;
        this.f96862c = (1.15f * f12) / 2.0f;
        this.f96863d = f11;
        this.f96864e = z11;
        this.f96865f = f12 / (f11 * 1.0f);
    }

    @Override // nz.c
    public final z e(int i5, int i11, z zVar, float f11) {
        float[] fArr = this.f96860a;
        if (i5 == -2) {
            j(fArr, 0);
        } else if (i5 == -3) {
            j(fArr, 1);
        } else if (i5 >= this.f96866g) {
            float f12 = (this.f96861b / 2.0f) - ((this.f96863d * f11) / 2.0f);
            fArr[1] = f12;
            fArr[0] = f12;
        } else {
            k(i5, i11, fArr);
        }
        float f13 = fArr[0];
        float f14 = fArr[1];
        if (zVar == null) {
            return new z(f13, f14, f11);
        }
        zVar.a(f13, f14, f11);
        return zVar;
    }

    @Override // nz.c
    public final float g() {
        return this.f96863d;
    }

    @Override // nz.c
    public final float h(int i5, int i11) {
        return l(i11);
    }

    public final void j(float[] fArr, int i5) {
        k(0, 4, fArr);
        float f11 = fArr[0];
        float f12 = fArr[1];
        k(3, 4, fArr);
        float f13 = fArr[0] - f11;
        float f14 = fArr[1] - f12;
        fArr[0] = (2 * f13) + f11;
        fArr[1] = (i5 * f14) + f12;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ad A[PHI: r1
      0x00ad: PHI (r1v13 int) = (r1v0 int), (r1v0 int), (r1v0 int), (r1v8 int), (r1v8 int), (r1v0 int) binds: [B:70:0x00cd, B:81:0x00e6, B:67:0x00c7, B:48:0x009c, B:53:0x00aa, B:41:0x008d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void k(int i5, int i11, float[] fArr) {
        double d5;
        int i12 = i5;
        int iMax = Math.max(i11, 2);
        boolean z11 = this.f96864e;
        double d11 = z11 ? 0.0d : 3.141592653589793d;
        int i13 = z11 ? 1 : -1;
        int i14 = this.f96866g;
        int i15 = 4;
        if (iMax != 3) {
            if (iMax == 4) {
                if (i14 != 4) {
                    d5 = 1.5707963267948966d;
                }
            } else if (iMax == 5) {
                d5 = 0.3141592653589793d;
            } else if (iMax == 6 || iMax == 7) {
                d5 = 0.5235987755982989d;
                iMax = 6;
            } else if (iMax == 8) {
                d5 = 0.6731984257692414d;
                iMax = 7;
            } else if (iMax == 9) {
                iMax = 8;
            } else {
                d5 = 0.0d;
            }
            d5 = 0.7853981633974483d;
        }
        double d12 = i13;
        double d13 = (d5 * d12) + d11;
        float fL = (l(iMax) * this.f96863d) / 2.0f;
        if (iMax == 4 && i12 == 3) {
            i15 = 2;
        } else if (iMax == 4 && i12 == 2) {
            i15 = 3;
        } else if (iMax == 5) {
            if (i12 != 3) {
                if (i12 != 4) {
                    i15 = i12;
                }
                i15 = 3;
            }
        } else if (iMax == 6) {
            if (i12 == 3) {
                i12 = 5;
            } else if (i12 == 5) {
                i12 = 3;
            }
            if (i11 != 7) {
                i15 = i12;
            } else {
                if (i12 == 4) {
                    float f11 = (this.f96861b / 2.0f) - fL;
                    fArr[0] = f11;
                    fArr[1] = f11;
                    return;
                }
                if (i12 != 6) {
                }
            }
        } else if (iMax == 7) {
            if (i12 == 3) {
                i15 = 6;
            } else if (i12 == 4) {
                float f12 = (this.f96861b / 2.0f) - fL;
                fArr[0] = f12;
                fArr[1] = f12;
                return;
            } else if (i12 == 5) {
                i15 = 3;
            } else if (i12 != 7) {
                if (i12 == 6) {
                    i15 = 5;
                }
            }
        } else if (iMax == 8) {
            if (i12 == 3) {
                i15 = 7;
            } else if (i12 == 4) {
                float f13 = (this.f96861b / 2.0f) - fL;
                fArr[0] = f13;
                fArr[1] = f13;
                return;
            } else if (i12 != 5) {
                if (i12 != 7) {
                    if (i12 != 8) {
                    }
                }
            }
        }
        double d14 = ((6.283185307179586d / iMax) * i15 * d12) + d13;
        fArr[0] = ((this.f96861b / 2.0f) + ((float) ((Math.cos(d14) * (((((iMax - 2) * 0.25f) / (i14 - 2)) + 1.0f) * this.f96862c)) / 2.0d))) - fL;
        fArr[1] = ((this.f96861b / 2.0f) + ((float) ((Math.sin(d14) * (-r2)) / 2.0d))) - fL;
    }

    public final float l(int i5) {
        if (this.f96861b != 0.0f) {
            return (i5 <= 3 ? 0.51f : i5 == 3 ? 0.475f : i5 == 4 ? 0.44f : i5 == 5 ? 0.4f : i5 == 6 ? 0.36f : i5 == 7 ? 0.33f : 0.3f) * this.f96865f;
        }
        mc0.d.b(new IllegalStateException("scaleForItem called without init"));
        return 1.0f;
    }
}
