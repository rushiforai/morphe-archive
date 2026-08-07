.class public Ll/n55$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n55;->P()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public constructor <init>(Ll/n55;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n55$d;->a:Ll/n55;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/n55$d;->a:Ll/n55;

    .line 2
    .line 3
    iget-object v0, p0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 4
    .line 5
    iget-object v1, p0, Ll/n55;->t:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x5

    .line 9
    invoke-static {p0, v3, v0, v1, v2}, Ll/n55;->E(Ll/n55;ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
