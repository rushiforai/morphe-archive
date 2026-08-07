.class public final Ll/jsp0$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jsp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "h"
.end annotation


# instance fields
.field public a:Lokio/ByteString;

.field public final synthetic b:Ll/jsp0;


# direct methods
.method public constructor <init>(Ll/jsp0;)V
    .locals 0

    .line 9
    iput-object p1, p0, Ll/jsp0$h;->b:Ll/jsp0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ll/jsp0;Lokio/ByteString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jsp0$h;->b:Ll/jsp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/jsp0$h;->a:Lokio/ByteString;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jsp0$h;->b:Ll/jsp0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jsp0$h;->a:Lokio/ByteString;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/jsp0;->q(Lokio/ByteString;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
