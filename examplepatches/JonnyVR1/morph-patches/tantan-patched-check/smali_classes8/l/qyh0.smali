.class public final synthetic Ll/qyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/a;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lv/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qyh0;->a:Lv/a;

    iput-boolean p2, p0, Ll/qyh0;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qyh0;->a:Lv/a;

    iget-boolean p0, p0, Ll/qyh0;->b:Z

    invoke-static {v0, p0}, Lv/a;->c(Lv/a;Z)V

    return-void
.end method
