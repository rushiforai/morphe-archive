.class public Lcom/meituan/robust/RobustArguments;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public current:Ljava/lang/Object;

.field public isStatic:Z

.field public methodNumber:I

.field public paramsArray:[Ljava/lang/Object;

.field public paramsClassTypes:[Ljava/lang/Class;

.field public returnType:Ljava/lang/Class;


# direct methods
.method public constructor <init>([Ljava/lang/Object;Ljava/lang/Object;ZI[Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/meituan/robust/RobustArguments;->paramsArray:[Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/meituan/robust/RobustArguments;->current:Ljava/lang/Object;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/meituan/robust/RobustArguments;->isStatic:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/meituan/robust/RobustArguments;->methodNumber:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/meituan/robust/RobustArguments;->paramsClassTypes:[Ljava/lang/Class;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/meituan/robust/RobustArguments;->returnType:Ljava/lang/Class;

    .line 15
    .line 16
    return-void
.end method
