.class public final synthetic Ll/a6q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    iput-object p2, p0, Ll/a6q;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a6q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    iget-object p0, p0, Ll/a6q;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->B(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
