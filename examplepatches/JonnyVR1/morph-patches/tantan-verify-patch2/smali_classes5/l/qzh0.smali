.class public final synthetic Ll/qzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wzh0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wzh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzh0;->a:Ll/wzh0;

    iput-object p2, p0, Ll/qzh0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzh0;->a:Ll/wzh0;

    iget-object p0, p0, Ll/qzh0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/wzh0;->c(Ll/wzh0;Ljava/lang/String;)V

    return-void
.end method
