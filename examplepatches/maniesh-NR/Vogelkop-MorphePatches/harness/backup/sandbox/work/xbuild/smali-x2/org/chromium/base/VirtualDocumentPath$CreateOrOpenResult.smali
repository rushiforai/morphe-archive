.class public final Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/VirtualDocumentPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CreateOrOpenResult"
.end annotation


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Z


# direct methods
.method public constructor <init>(ZLandroid/net/Uri;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->a:Landroid/net/Uri;

    iput-boolean p1, p0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->b:Z

    return-void
.end method


# virtual methods
.method public final getContentUriString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->a:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getCreated()Z
    .registers 1

    iget-boolean p0, p0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->b:Z

    return p0
.end method
