.class public final synthetic Ll/agw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a7h0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/agw;->a:I

    iput p2, p0, Ll/agw;->b:I

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/agw;->a:I

    iget p0, p0, Ll/agw;->b:I

    invoke-static {v0, p0}, Ll/cgw;->b(II)Ll/npy;

    move-result-object p0

    return-object p0
.end method
