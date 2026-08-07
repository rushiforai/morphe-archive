.class public final synthetic Ll/o20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act$t;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act$t;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o20;->a:Lcom/p1/mobile/android/app/Act$t;

    iput p2, p0, Ll/o20;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o20;->a:Lcom/p1/mobile/android/app/Act$t;

    iget p0, p0, Ll/o20;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/android/app/Act$t;->a(Lcom/p1/mobile/android/app/Act$t;I)V

    return-void
.end method
