.class public final Ls41;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls41;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ls41;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ls41;->a:Ls41;

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    return-void
.end method
