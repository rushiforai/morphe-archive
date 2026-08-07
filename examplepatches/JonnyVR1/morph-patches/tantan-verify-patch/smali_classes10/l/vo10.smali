.class public final synthetic Ll/vo10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Ll/wo10;


# direct methods
.method public synthetic constructor <init>(IILl/wo10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/vo10;->a:I

    iput p2, p0, Ll/vo10;->b:I

    iput-object p3, p0, Ll/vo10;->c:Ll/wo10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/vo10;->a:I

    iget v1, p0, Ll/vo10;->b:I

    iget-object p0, p0, Ll/vo10;->c:Ll/wo10;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/wo10;->K3(IILl/wo10;Ljava/lang/Boolean;)V

    return-void
.end method
