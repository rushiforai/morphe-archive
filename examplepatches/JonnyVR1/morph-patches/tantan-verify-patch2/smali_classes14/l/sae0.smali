.class public final synthetic Ll/sae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sae0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/sae0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sae0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/sae0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sae0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/sae0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/sae0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/sae0;->d:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/zae0;->f(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
