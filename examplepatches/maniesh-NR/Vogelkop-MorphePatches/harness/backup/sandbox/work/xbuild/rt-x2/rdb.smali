.class public final Lrdb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lws7;

.field public b:I


# direct methods
.method public constructor <init>(Lws7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrdb;->a:Lws7;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget v0, p0, Lrdb;->b:I

    const/4 v1, 0x1

    if-eqz p1, :cond_9

    add-int/2addr v0, v1

    iput v0, p0, Lrdb;->b:I

    goto :goto_d

    :cond_9
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lrdb;->b:I

    :goto_d
    iget-object p0, p0, Lrdb;->a:Lws7;

    if-ne v0, v1, :cond_17

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lws7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_17
    if-nez v0, :cond_1e

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lws7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    return-void
.end method
