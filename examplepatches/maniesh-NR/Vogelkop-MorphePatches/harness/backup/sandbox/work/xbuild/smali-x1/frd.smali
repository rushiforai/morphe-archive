.class public final Lfrd;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ld8j;

.field public final d:Lqoj;

.field public final e:Lj3i;

.field public final f:Z

.field public final g:Lnak;

.field public final h:Lrlh;

.field public final i:Ls9;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;Lqoj;Lj3i;Z)V
    .registers 6

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lfrd;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lfrd;->c:Ld8j;

    iput-object p3, p0, Lfrd;->d:Lqoj;

    iput-object p4, p0, Lfrd;->e:Lj3i;

    iput-boolean p5, p0, Lfrd;->f:Z

    new-instance p2, Lerd;

    const-string p3, "media_background_play"

    invoke-virtual {p1, p3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    invoke-virtual {p4}, Lj3i;->invoke()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    invoke-direct {p2, p3, p4, p5}, Lerd;-><init>(ZZZ)V

    invoke-static {p2}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p2

    iput-object p2, p0, Lfrd;->g:Lnak;

    invoke-static {p2}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lfrd;->h:Lrlh;

    new-instance p2, Ls9;

    const/16 p3, 0x16

    invoke-direct {p2, p0, p3}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lfrd;->i:Ls9;

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object v0, p0, Lfrd;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lfrd;->i:Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
