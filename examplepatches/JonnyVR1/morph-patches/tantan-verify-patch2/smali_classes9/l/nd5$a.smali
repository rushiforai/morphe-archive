.class public Ll/nd5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nd5;->A(Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Ll/nd5;


# direct methods
.method public constructor <init>(Ll/nd5;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nd5$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nd5$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/nd5$a;->c:Ll/y20;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d(Ll/nd5$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nd5$a;->e()V

    return-void
.end method

.method private synthetic e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 2
    .line 3
    invoke-static {v0}, Ll/nd5;->p(Ll/nd5;)Ll/a30;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 14
    .line 15
    invoke-static {v0}, Ll/nd5;->p(Ll/nd5;)Ll/a30;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 20
    .line 21
    invoke-static {v1}, Ll/nd5;->q(Ll/nd5;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 26
    .line 27
    invoke-static {v2}, Ll/nd5;->l(Ll/nd5;)Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object p0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 32
    .line 33
    invoke-static {p0}, Ll/nd5;->o(Ll/nd5;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {v0, v1, v2, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->e8:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 2
    .line 3
    invoke-static {v0}, Ll/nd5;->q(Ll/nd5;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "coin"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/fp60;->K(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 13
    .line 14
    invoke-static {v0}, Ll/nd5;->l(Ll/nd5;)Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->G6:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/nd5$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 46
    .line 47
    invoke-static {v0}, Ll/nd5;->m(Ll/nd5;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/16 v1, 0x19

    .line 52
    .line 53
    if-ne v0, v1, :cond_0

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 64
    .line 65
    invoke-static {v1}, Ll/nd5;->l(Ll/nd5;)Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Ll/nd5$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    new-instance v3, Ll/md5;

    .line 76
    .line 77
    invoke-direct {v3, p0}, Ll/md5;-><init>(Ll/nd5$a;)V

    .line 78
    .line 79
    .line 80
    const/4 v4, 0x0

    .line 81
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ll/x20;Ll/x20;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 86
    .line 87
    invoke-static {v0}, Ll/nd5;->p(Ll/nd5;)Ll/a30;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    iget-object v0, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 98
    .line 99
    invoke-static {v0}, Ll/nd5;->p(Ll/nd5;)Ll/a30;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 104
    .line 105
    invoke-static {v1}, Ll/nd5;->q(Ll/nd5;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget-object v2, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 110
    .line 111
    invoke-static {v2}, Ll/nd5;->l(Ll/nd5;)Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v3, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 116
    .line 117
    invoke-static {v3}, Ll/nd5;->o(Ll/nd5;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v0, v1, v2, v3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    :cond_1
    :goto_0
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v1, p0, Ll/nd5$a;->d:Ll/nd5;

    .line 129
    .line 130
    invoke-static {v1}, Ll/nd5;->n(Ll/nd5;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Ll/a5i0;->N0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v1, p0, Ll/nd5$a;->b:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ll/a5i0;->M0(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/nd5$a;->c:Ll/y20;

    .line 147
    .line 148
    const/4 v0, 0x0

    .line 149
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method
