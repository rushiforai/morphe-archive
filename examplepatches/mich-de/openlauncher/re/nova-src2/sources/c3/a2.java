package c3;

import android.view.View;
import androidx.compose.ui.platform.AndroidComposeView;

/* loaded from: classes.dex */
public final class a2 implements q2.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19207a;

    /* renamed from: b, reason: collision with root package name */
    public final View f19208b;

    public /* synthetic */ a2(View view, int i5) {
        this.f19207a = i5;
        this.f19208b = view;
    }

    @Override // q2.a
    public final void a(int i5) {
        switch (this.f19207a) {
            case 0:
                boolean zG = p6.p0.g(i5, 16);
                View view = this.f19208b;
                if (!zG) {
                    if (!p6.p0.g(i5, 6)) {
                        if (!p6.p0.g(i5, 13)) {
                            if (!p6.p0.g(i5, 23)) {
                                if (!p6.p0.g(i5, 3)) {
                                    if (!p6.p0.g(i5, 0)) {
                                        if (!p6.p0.g(i5, 17)) {
                                            if (!p6.p0.g(i5, 27)) {
                                                if (!p6.p0.g(i5, 26)) {
                                                    if (!p6.p0.g(i5, 9)) {
                                                        if (!p6.p0.g(i5, 22)) {
                                                            if (!p6.p0.g(i5, 21)) {
                                                                if (p6.p0.g(i5, 1)) {
                                                                    view.performHapticFeedback(1);
                                                                    break;
                                                                }
                                                            } else {
                                                                view.performHapticFeedback(21);
                                                                break;
                                                            }
                                                        } else {
                                                            view.performHapticFeedback(22);
                                                            break;
                                                        }
                                                    } else {
                                                        view.performHapticFeedback(9);
                                                        break;
                                                    }
                                                } else {
                                                    view.performHapticFeedback(26);
                                                    break;
                                                }
                                            } else {
                                                view.performHapticFeedback(27);
                                                break;
                                            }
                                        } else {
                                            view.performHapticFeedback(17);
                                            break;
                                        }
                                    } else {
                                        view.performHapticFeedback(0);
                                        break;
                                    }
                                } else {
                                    view.performHapticFeedback(3);
                                    break;
                                }
                            } else {
                                view.performHapticFeedback(23);
                                break;
                            }
                        } else {
                            view.performHapticFeedback(13);
                            break;
                        }
                    } else {
                        view.performHapticFeedback(6);
                        break;
                    }
                } else {
                    view.performHapticFeedback(16);
                    break;
                }
                break;
            default:
                AndroidComposeView androidComposeView = (AndroidComposeView) this.f19208b;
                if (!p6.p0.g(i5, 16)) {
                    if (!p6.p0.g(i5, 6)) {
                        if (!p6.p0.g(i5, 13)) {
                            if (!p6.p0.g(i5, 23)) {
                                if (!p6.p0.g(i5, 3)) {
                                    if (!p6.p0.g(i5, 0)) {
                                        if (!p6.p0.g(i5, 17)) {
                                            if (!p6.p0.g(i5, 27)) {
                                                if (!p6.p0.g(i5, 26)) {
                                                    if (!p6.p0.g(i5, 9)) {
                                                        if (!p6.p0.g(i5, 22)) {
                                                            if (!p6.p0.g(i5, 21)) {
                                                                if (p6.p0.g(i5, 1)) {
                                                                    androidComposeView.performHapticFeedback(1);
                                                                    break;
                                                                }
                                                            } else {
                                                                androidComposeView.performHapticFeedback(21);
                                                                break;
                                                            }
                                                        } else {
                                                            androidComposeView.performHapticFeedback(22);
                                                            break;
                                                        }
                                                    } else {
                                                        androidComposeView.performHapticFeedback(9);
                                                        break;
                                                    }
                                                } else {
                                                    androidComposeView.performHapticFeedback(26);
                                                    break;
                                                }
                                            } else {
                                                androidComposeView.performHapticFeedback(27);
                                                break;
                                            }
                                        } else {
                                            androidComposeView.performHapticFeedback(17);
                                            break;
                                        }
                                    } else {
                                        androidComposeView.performHapticFeedback(0);
                                        break;
                                    }
                                } else {
                                    androidComposeView.performHapticFeedback(3);
                                    break;
                                }
                            } else {
                                androidComposeView.performHapticFeedback(23);
                                break;
                            }
                        } else {
                            androidComposeView.performHapticFeedback(13);
                            break;
                        }
                    } else {
                        androidComposeView.performHapticFeedback(6);
                        break;
                    }
                } else {
                    androidComposeView.performHapticFeedback(16);
                    break;
                }
                break;
        }
    }
}
