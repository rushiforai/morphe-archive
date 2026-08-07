.class Lcom/momo/mcamera/mask/FaceMaskFilter$Model;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/FaceMaskFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Model"
.end annotation


# instance fields
.field comic:Z

.field data:[B

.field texCoords:[F

.field final synthetic this$0:Lcom/momo/mcamera/mask/FaceMaskFilter;


# direct methods
.method private constructor <init>(Lcom/momo/mcamera/mask/FaceMaskFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->this$0:Lcom/momo/mcamera/mask/FaceMaskFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/mcamera/mask/FaceMaskFilter;Lcom/momo/mcamera/mask/FaceMaskFilter$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;-><init>(Lcom/momo/mcamera/mask/FaceMaskFilter;)V

    return-void
.end method
