.class public final synthetic Ll/n4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/o4l;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/o4l;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n4l;->a:Ll/o4l;

    iput p2, p0, Ll/n4l;->b:I

    iput p3, p0, Ll/n4l;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n4l;->a:Ll/o4l;

    iget v1, p0, Ll/n4l;->b:I

    iget p0, p0, Ll/n4l;->c:I

    invoke-static {v0, v1, p0}, Ll/o4l$a;->j(Ll/o4l;II)V

    return-void
.end method
