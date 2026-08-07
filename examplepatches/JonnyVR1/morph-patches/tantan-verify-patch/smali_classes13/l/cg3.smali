.class public final synthetic Ll/cg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/d;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iput-object p2, p0, Ll/cg3;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iget-object p0, p0, Ll/cg3;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->a(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
