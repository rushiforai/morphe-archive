.class public final synthetic Ll/ks3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ns3;


# direct methods
.method public synthetic constructor <init>(Ll/ns3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ks3;->a:Ll/ns3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ks3;->a:Ll/ns3;

    invoke-static {p0, p1}, Ll/ns3;->k(Ll/ns3;Landroid/view/View;)V

    return-void
.end method
