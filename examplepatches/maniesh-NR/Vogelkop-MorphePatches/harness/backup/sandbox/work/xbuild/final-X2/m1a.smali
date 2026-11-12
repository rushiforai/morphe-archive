.class public final synthetic Lm1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lp1a;

.field public final synthetic b:S


# direct methods
.method public synthetic constructor <init>(Lp1a;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm1a;->a:Lp1a;

    iput-short p2, p0, Lm1a;->b:S

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 4

    iget-object v0, p0, Lm1a;->a:Lp1a;

    iget-short p0, p0, Lm1a;->b:S

    invoke-virtual {v0, p0, p1, p2}, Lp1a;->a(IILandroid/content/Intent;)V

    return-void
.end method
