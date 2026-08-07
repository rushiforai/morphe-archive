.class public interface abstract Ll/h5l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ll/h5l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fpd;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fpd;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/h5l;->a:Ll/h5l;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/net/Uri;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;Ljava/util/Map;Ll/asf;Ll/bf80;)Ll/k5l;
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/h0j0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/asf;",
            "Ll/bf80;",
            ")",
            "Ll/k5l;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
