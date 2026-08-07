.class public final synthetic Ll/i70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/ump/ConsentInformation$b;


# instance fields
.field public final synthetic a:Ll/n70;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i70;->a:Ll/n70;

    iput-object p2, p0, Ll/i70;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/i70;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i70;->a:Ll/n70;

    iget-object v1, p0, Ll/i70;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/i70;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/n70;->a(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    return-void
.end method
