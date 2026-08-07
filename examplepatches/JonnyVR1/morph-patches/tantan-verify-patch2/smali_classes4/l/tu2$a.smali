.class public Ll/tu2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/myv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tu2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/myv;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tu2$a;->a:Ll/myv;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Ll/myv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tu2$a;->a:Ll/myv;

    .line 2
    .line 3
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tu2$a;->a:Ll/myv;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/myv;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
