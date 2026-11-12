.class public final Lm6g;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lot2;

.field public final e:Lhxk;

.field public final f:Lk6g;

.field public final g:Lcom/opera/android/autofill/PasswordManager;

.field public final h:Lx5g;

.field public final i:Lyu2;

.field public final j:Lysj;

.field public final k:Ln6g;

.field public final l:Lru9;

.field public final m:Ljvg;

.field public n:Z


# direct methods
.method public constructor <init>(Lgjm;Lot2;Ld8j;Lhxk;Lcom/opera/android/settings/SettingsManager;Lk6g;Lcom/opera/android/autofill/PasswordManager;Lx5g;Lyu2;Lysj;Ln6g;Lru9;)V
    .registers 13

    invoke-direct {p0, p5, p3}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p2, p0, Lm6g;->d:Lot2;

    iput-object p4, p0, Lm6g;->e:Lhxk;

    iput-object p6, p0, Lm6g;->f:Lk6g;

    iput-object p7, p0, Lm6g;->g:Lcom/opera/android/autofill/PasswordManager;

    iput-object p8, p0, Lm6g;->h:Lx5g;

    iput-object p9, p0, Lm6g;->i:Lyu2;

    iput-object p10, p0, Lm6g;->j:Lysj;

    iput-object p11, p0, Lm6g;->k:Ln6g;

    iput-object p12, p0, Lm6g;->l:Lru9;

    new-instance p2, Ljvg;

    invoke-direct {p2, p0, p1}, Ljvg;-><init>(Ll7n;Lgjm;)V

    iput-object p2, p0, Lm6g;->m:Ljvg;

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 1

    iget-object p0, p0, Lm6g;->f:Lk6g;

    invoke-virtual {p0}, Lk6g;->a()V

    return-void
.end method
