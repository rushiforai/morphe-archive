.class public final synthetic Ll/q6h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s6h0;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/s6h0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q6h0;->a:Ll/s6h0;

    iput p2, p0, Ll/q6h0;->b:I

    iput p3, p0, Ll/q6h0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q6h0;->a:Ll/s6h0;

    iget v1, p0, Ll/q6h0;->b:I

    iget p0, p0, Ll/q6h0;->c:I

    invoke-static {v0, v1, p0}, Ll/s6h0;->b(Ll/s6h0;II)V

    return-void
.end method
