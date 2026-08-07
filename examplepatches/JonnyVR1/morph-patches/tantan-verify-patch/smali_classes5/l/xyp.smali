.class public final synthetic Ll/xyp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zyp;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/zyp;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xyp;->a:Ll/zyp;

    iput p2, p0, Ll/xyp;->b:I

    iput p3, p0, Ll/xyp;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xyp;->a:Ll/zyp;

    iget v1, p0, Ll/xyp;->b:I

    iget p0, p0, Ll/xyp;->c:I

    check-cast p1, [I

    invoke-static {v0, v1, p0, p1}, Ll/zyp;->a(Ll/zyp;II[I)V

    return-void
.end method
