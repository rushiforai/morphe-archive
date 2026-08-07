.class public final synthetic Ll/dsv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/hsv0;


# direct methods
.method public synthetic constructor <init>(Ll/hsv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dsv0;->a:Ll/hsv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsv0;->a:Ll/hsv0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/hsv0;->a(Ll/hsv0;)Ll/isv0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
