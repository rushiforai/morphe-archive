.class public final synthetic Ll/xuk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yuk;

.field public final synthetic b:I

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/yuk;ILl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xuk;->a:Ll/yuk;

    iput p2, p0, Ll/xuk;->b:I

    iput-object p3, p0, Ll/xuk;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xuk;->a:Ll/yuk;

    iget v1, p0, Ll/xuk;->b:I

    iget-object p0, p0, Ll/xuk;->c:Ll/y20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/yuk;->S3(Ll/yuk;ILl/y20;Ljava/lang/Long;)V

    return-void
.end method
