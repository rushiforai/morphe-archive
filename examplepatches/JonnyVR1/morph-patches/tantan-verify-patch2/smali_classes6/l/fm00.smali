.class public final synthetic Ll/fm00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zm00;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/zm00;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fm00;->a:Ll/zm00;

    iput p2, p0, Ll/fm00;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fm00;->a:Ll/zm00;

    iget p0, p0, Ll/fm00;->b:I

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/zm00;->e0(Ll/zm00;ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method
