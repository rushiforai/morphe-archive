.class public final synthetic Ll/em00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/zm00;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/zm00;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/em00;->a:Ll/zm00;

    iput p2, p0, Ll/em00;->b:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/em00;->a:Ll/zm00;

    iget p0, p0, Ll/em00;->b:I

    invoke-static {v0, p0}, Ll/zm00;->r0(Ll/zm00;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
