.class public Lcom/tencent/open/utils/HttpUtils$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/open/utils/HttpUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/open/utils/HttpUtils$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/open/utils/HttpUtils$a;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILcom/tencent/open/utils/HttpUtils$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/tencent/open/utils/HttpUtils$a;-><init>(Ljava/lang/String;I)V

    return-void
.end method
