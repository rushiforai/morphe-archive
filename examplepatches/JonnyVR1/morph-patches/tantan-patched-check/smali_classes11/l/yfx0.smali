.class public abstract Ll/yfx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ekx0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/ads/h5<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ll/yfx0<",
        "TMessageType;TBuilderType;>;>",
        "Ljava/lang/Object;",
        "Ll/ekx0;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract b()Ll/yfx0;
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yfx0;->b()Ll/yfx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
