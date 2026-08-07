.class public final synthetic Ll/vzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wzh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vzh0;->a:Ll/wzh0$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzh0;->a:Ll/wzh0$a;

    invoke-static {p0}, Ll/wzh0$a;->a(Ll/wzh0$a;)V

    return-void
.end method
