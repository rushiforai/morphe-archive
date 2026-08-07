.class public final synthetic Ll/zet;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bft;


# direct methods
.method public synthetic constructor <init>(Ll/bft;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zet;->a:Ll/bft;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zet;->a:Ll/bft;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/bft;->Y3(Ll/bft;Landroid/net/NetworkInfo;)V

    return-void
.end method
