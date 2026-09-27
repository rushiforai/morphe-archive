.class public final Lutil/JsonPatch$Option;
.super Ljava/lang/Object;
.source "PatchListGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lutil/JsonPatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Option"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0001\u0012\u0016\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u000fR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R!\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lutil/JsonPatch$Option;",
        "",
        "key",
        "",
        "title",
        "description",
        "required",
        "",
        "type",
        "default",
        "values",
        "",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Object;Ljava/util/Map;)V",
        "getKey",
        "()Ljava/lang/String;",
        "getTitle",
        "getDescription",
        "getRequired",
        "()Z",
        "getType",
        "getDefault",
        "()Ljava/lang/Object;",
        "getValues",
        "()Ljava/util/Map;",
        "app.yydarlinker:patches"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final default:Ljava/lang/Object;

.field private final description:Ljava/lang/String;

.field private final key:Ljava/lang/String;

.field private final required:Z

.field private final title:Ljava/lang/String;

.field private final type:Ljava/lang/String;

.field private final values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Object;Ljava/util/Map;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lutil/JsonPatch$Option;->key:Ljava/lang/String;

    .line 114
    iput-object p2, p0, Lutil/JsonPatch$Option;->title:Ljava/lang/String;

    .line 115
    iput-object p3, p0, Lutil/JsonPatch$Option;->description:Ljava/lang/String;

    .line 116
    iput-boolean p4, p0, Lutil/JsonPatch$Option;->required:Z

    .line 117
    iput-object p5, p0, Lutil/JsonPatch$Option;->type:Ljava/lang/String;

    .line 118
    iput-object p6, p0, Lutil/JsonPatch$Option;->default:Ljava/lang/Object;

    .line 119
    iput-object p7, p0, Lutil/JsonPatch$Option;->values:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final getDefault()Ljava/lang/Object;
    .registers 1

    .line 118
    iget-object p0, p0, Lutil/JsonPatch$Option;->default:Ljava/lang/Object;

    return-object p0
.end method

.method public final getDescription()Ljava/lang/String;
    .registers 1

    .line 115
    iget-object p0, p0, Lutil/JsonPatch$Option;->description:Ljava/lang/String;

    return-object p0
.end method

.method public final getKey()Ljava/lang/String;
    .registers 1

    .line 113
    iget-object p0, p0, Lutil/JsonPatch$Option;->key:Ljava/lang/String;

    return-object p0
.end method

.method public final getRequired()Z
    .registers 1

    .line 116
    iget-boolean p0, p0, Lutil/JsonPatch$Option;->required:Z

    return p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    .line 114
    iget-object p0, p0, Lutil/JsonPatch$Option;->title:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()Ljava/lang/String;
    .registers 1

    .line 117
    iget-object p0, p0, Lutil/JsonPatch$Option;->type:Ljava/lang/String;

    return-object p0
.end method

.method public final getValues()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 119
    iget-object p0, p0, Lutil/JsonPatch$Option;->values:Ljava/util/Map;

    return-object p0
.end method
