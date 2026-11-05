.class public final Le/e/a/CachedCommentMetadata$Owner;
.super Ljava/lang/Object;
.source "CachedCommentMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CachedCommentMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Owner"
.end annotation


# instance fields
.field public final modernWatch:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .registers 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CachedCommentMetadata$Owner;->modernWatch:Lorg/json/JSONObject;

    return-void
.end method
