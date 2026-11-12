.class public interface abstract Leri;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcri;->a:Lcri;

    sput-object v0, Leri;->a:Lcri;

    return-void
.end method


# virtual methods
.method public abstract a(ILp6l;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract b()Z
.end method

.method public abstract c()Z
.end method

.method public abstract cancel()V
.end method

.method public abstract d()Z
.end method

.method public abstract e()Z
.end method

.method public abstract f()Z
.end method

.method public abstract g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;
.end method

.method public abstract getId()J
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract h(Leh7;Lcom/opera/api/Callback;)Lhh4;
.end method

.method public abstract i(Ljava/lang/String;ZLtn;)V
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public abstract k()Ljava/lang/String;
.end method

.method public l()Ljava/lang/String;
    .registers 2

    invoke-interface {p0}, Leri;->d()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string p0, "user"

    return-object p0

    :cond_9
    invoke-interface {p0}, Leri;->getTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public abstract m()I
.end method
