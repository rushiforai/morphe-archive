.class public final synthetic Ll/wh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yh2;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/yh2;Ljava/lang/String;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wh2;->a:Ll/yh2;

    iput-object p2, p0, Ll/wh2;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wh2;->c:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wh2;->a:Ll/yh2;

    iget-object v1, p0, Ll/wh2;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wh2;->c:Ll/qcj;

    invoke-static {v0, v1, p0}, Ll/yh2;->T3(Ll/yh2;Ljava/lang/String;Ll/qcj;)V

    return-void
.end method
