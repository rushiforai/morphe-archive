.class public final synthetic Ll/zgg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/chg0;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/chg0;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zgg0;->a:Ll/chg0;

    iput p2, p0, Ll/zgg0;->b:I

    iput-object p3, p0, Ll/zgg0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zgg0;->a:Ll/chg0;

    iget v1, p0, Ll/zgg0;->b:I

    iget-object p0, p0, Ll/zgg0;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Ll/chg0;->b(ILjava/lang/String;)V

    return-void
.end method
