.class public final synthetic Lcom/tantanapp/common/network/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/network/b;->a:Ljava/lang/String;

    iput p2, p0, Lcom/tantanapp/common/network/b;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/b;->a:Ljava/lang/String;

    iget p0, p0, Lcom/tantanapp/common/network/b;->b:I

    check-cast p1, Lcom/tantanapp/common/network/ObservableRunner$Req;

    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->d(Ljava/lang/String;ILcom/tantanapp/common/network/ObservableRunner$Req;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
