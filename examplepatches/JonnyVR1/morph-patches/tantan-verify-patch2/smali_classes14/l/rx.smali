.class public final synthetic Ll/rx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tx$a;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/tx$a;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rx;->a:Ll/tx$a;

    iput p2, p0, Ll/rx;->b:I

    iput-object p3, p0, Ll/rx;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rx;->a:Ll/tx$a;

    iget v1, p0, Ll/rx;->b:I

    iget-object p0, p0, Ll/rx;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/tx$a;->d(Ll/tx$a;ILjava/lang/String;)V

    return-void
.end method
