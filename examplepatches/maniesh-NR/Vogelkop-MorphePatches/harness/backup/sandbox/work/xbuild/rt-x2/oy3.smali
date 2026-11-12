.class public final Loy3;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lg8j;

.field public final e:Lru9;

.field public final f:Lorm;

.field public final g:Lskm;

.field public final h:Lysj;

.field public final i:Lmm6;

.field public final j:Lny3;

.field public final k:Lg0c;


# direct methods
.method public constructor <init>(Lg8j;Lcom/opera/android/settings/SettingsManager;Lru9;Lorm;Lskm;Lysj;Lmm6;Lny3;Lg0c;)V
    .registers 10

    invoke-direct {p0, p2, p1}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p1, p0, Loy3;->d:Lg8j;

    iput-object p3, p0, Loy3;->e:Lru9;

    iput-object p4, p0, Loy3;->f:Lorm;

    iput-object p5, p0, Loy3;->g:Lskm;

    iput-object p6, p0, Loy3;->h:Lysj;

    iput-object p7, p0, Loy3;->i:Lmm6;

    iput-object p8, p0, Loy3;->j:Lny3;

    iput-object p9, p0, Loy3;->k:Lg0c;

    return-void
.end method


# virtual methods
.method public final f()Ld8j;
    .registers 1

    iget-object p0, p0, Loy3;->d:Lg8j;

    return-object p0
.end method
