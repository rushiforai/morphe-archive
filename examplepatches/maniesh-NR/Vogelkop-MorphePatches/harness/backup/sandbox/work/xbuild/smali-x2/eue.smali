.class public final Leue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Lfqe;

.field public final synthetic b:Lfue;


# direct methods
.method public constructor <init>(Lfqe;Lfue;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leue;->b:Lfue;

    iput-object p1, p0, Leue;->a:Lfqe;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Leue;->b:Lfue;

    iget-object v1, v0, Lfue;->f:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "news_is_blocked_by_personalization_change"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    const/4 v1, 0x0

    iput-object v1, v0, Lfue;->b:Ll1c;

    :cond_f
    iget-object p0, p0, Leue;->a:Lfqe;

    invoke-static {v0}, Lfue;->a(Lfue;)Leue;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfqe;->a(Lq8j;)V

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ll1c;

    iget-object p0, p0, Leue;->b:Lfue;

    iput-object p1, p0, Lfue;->b:Ll1c;

    invoke-virtual {p0}, Lfue;->d()V

    return-void
.end method
