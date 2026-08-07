.class public Lcom/alibaba/fastjson/support/spring/FastJsonContainer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private filters:Lcom/alibaba/fastjson/support/spring/PropertyPreFilters;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonContainer;->value:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getFilters()Lcom/alibaba/fastjson/support/spring/PropertyPreFilters;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonContainer;->filters:Lcom/alibaba/fastjson/support/spring/PropertyPreFilters;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonContainer;->value:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFilters(Lcom/alibaba/fastjson/support/spring/PropertyPreFilters;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonContainer;->filters:Lcom/alibaba/fastjson/support/spring/PropertyPreFilters;

    .line 2
    .line 3
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonContainer;->value:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method
