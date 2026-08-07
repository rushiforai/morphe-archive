.class public final synthetic Ll/en0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pn0$a;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/pn0$a;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/en0;->a:Ll/pn0$a;

    iput-object p2, p0, Ll/en0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/en0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/en0;->a:Ll/pn0$a;

    iget-object v1, p0, Ll/en0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/en0;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/pn0;->d(Ll/pn0$a;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    return-void
.end method
