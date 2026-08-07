.class public Lcom/p1/mobile/android/app/Frag$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Frag;->u4(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/android/app/a$a;

.field public final synthetic c:Lcom/p1/mobile/android/app/Frag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/android/app/a$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag$c;->c:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/android/app/Frag$c;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/android/app/Frag$c;->b:Lcom/p1/mobile/android/app/a$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/app/Frag$c;->a:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$c;->b:Lcom/p1/mobile/android/app/a$a;

    .line 6
    .line 7
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/android/app/a$a;->a(IILandroid/content/Intent;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p2, p0, Lcom/p1/mobile/android/app/Frag$c;->c:Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/p1/mobile/android/app/Frag;->Y3(Lcom/p1/mobile/android/app/Frag;)Lcom/p1/mobile/android/app/a;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/a;->d(Lcom/p1/mobile/android/app/a$a;)V

    .line 18
    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method
