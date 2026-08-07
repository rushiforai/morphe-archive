.class public final synthetic Ll/kz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r00;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/r00;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kz;->a:Ll/r00;

    iput p2, p0, Ll/kz;->b:I

    iput p3, p0, Ll/kz;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kz;->a:Ll/r00;

    iget v1, p0, Ll/kz;->b:I

    iget p0, p0, Ll/kz;->c:I

    invoke-static {v0, v1, p0}, Ll/r00;->j0(Ll/r00;II)V

    return-void
.end method
