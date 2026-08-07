.class public final synthetic Ll/qn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[B

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>([BIILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qn5;->a:[B

    iput p2, p0, Ll/qn5;->b:I

    iput p3, p0, Ll/qn5;->c:I

    iput-object p4, p0, Ll/qn5;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qn5;->a:[B

    iget v1, p0, Ll/qn5;->b:I

    iget v2, p0, Ll/qn5;->c:I

    iget-object p0, p0, Ll/qn5;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->a([BIILjava/lang/String;)V

    return-void
.end method
