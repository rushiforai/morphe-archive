.class public final synthetic Ll/xub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zub0;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/zub0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xub0;->a:Ll/zub0;

    iput p2, p0, Ll/xub0;->b:I

    iput p3, p0, Ll/xub0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xub0;->a:Ll/zub0;

    iget v1, p0, Ll/xub0;->b:I

    iget p0, p0, Ll/xub0;->c:I

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/zub0;->b(Ll/zub0;IILl/uxj0;)V

    return-void
.end method
