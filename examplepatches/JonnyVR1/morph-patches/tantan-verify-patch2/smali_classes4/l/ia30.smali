.class public final synthetic Ll/ia30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Frag;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ia30;->a:Lcom/p1/mobile/android/app/Frag;

    iput-object p2, p0, Ll/ia30;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ia30;->a:Lcom/p1/mobile/android/app/Frag;

    iget-object p0, p0, Ll/ia30;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->A4(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
