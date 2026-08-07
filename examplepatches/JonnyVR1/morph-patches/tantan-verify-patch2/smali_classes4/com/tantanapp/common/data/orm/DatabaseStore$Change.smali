.class public Lcom/tantanapp/common/data/orm/DatabaseStore$Change;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Change"
.end annotation


# static fields
.field static final DELETE:I = 0x0

.field static final INSERT:I = 0x1

.field static final UPDATE:I = 0x2


# instance fields
.field public final item:Lcom/tantanapp/common/data/DbObject;

.field public final item2:Lcom/tantanapp/common/data/DbObject;

.field public final type:I


# direct methods
.method public constructor <init>(ILcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->type:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 9
    .line 10
    return-void
.end method
