.class public final synthetic Ll/g5a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g6a0;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5a0;->a:Ll/g6a0;

    iput-object p2, p0, Ll/g5a0;->b:Landroid/content/Intent;

    iput p3, p0, Ll/g5a0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g5a0;->a:Ll/g6a0;

    iget-object v1, p0, Ll/g5a0;->b:Landroid/content/Intent;

    iget p0, p0, Ll/g5a0;->c:I

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/g6a0;->P0(Ll/g6a0;Landroid/content/Intent;ILcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
