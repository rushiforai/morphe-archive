.class public Lcom/tencent/could/huiyansdk/manager/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/manager/b$b;
    }
.end annotation


# instance fields
.field public a:Lcom/tencent/could/huiyansdk/enums/AuthState;

.field public b:Lcom/tencent/could/huiyansdk/callback/a;

.field public c:Lcom/tencent/could/huiyansdk/callback/b;

.field public d:Z

.field public e:[I

.field public f:[I

.field public g:[I

.field public h:[I

.field public i:I

.field public j:I

.field public k:I

.field public l:Lcom/tencent/could/huiyansdk/manager/f;

.field public m:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public volatile s:Z


# direct methods
.method public constructor <init>()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/AuthState;->PREPARE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->a:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->d:Z

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    iput v2, v0, Lcom/tencent/could/huiyansdk/manager/b;->i:I

    .line 15
    .line 16
    iput v2, v0, Lcom/tencent/could/huiyansdk/manager/b;->j:I

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    iput v2, v0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 20
    .line 21
    iput-boolean v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->s:Z

    .line 22
    .line 23
    sget v3, Lcom/tencent/could/huiyansdk/R$string;->fl_no_face:I

    .line 24
    .line 25
    sget v4, Lcom/tencent/could/huiyansdk/R$string;->fl_incomplete_face:I

    .line 26
    .line 27
    sget v5, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_incorrect:I

    .line 28
    .line 29
    sget v6, Lcom/tencent/could/huiyansdk/R$string;->fl_no_left_face:I

    .line 30
    .line 31
    sget v7, Lcom/tencent/could/huiyansdk/R$string;->fl_no_right_face:I

    .line 32
    .line 33
    sget v8, Lcom/tencent/could/huiyansdk/R$string;->fl_no_chin:I

    .line 34
    .line 35
    sget v9, Lcom/tencent/could/huiyansdk/R$string;->fl_no_mouth:I

    .line 36
    .line 37
    sget v10, Lcom/tencent/could/huiyansdk/R$string;->fl_no_nose:I

    .line 38
    .line 39
    sget v11, Lcom/tencent/could/huiyansdk/R$string;->fl_no_left_eye:I

    .line 40
    .line 41
    sget v12, Lcom/tencent/could/huiyansdk/R$string;->fl_no_right_eye:I

    .line 42
    .line 43
    sget v13, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_closer:I

    .line 44
    .line 45
    sget v14, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_farer:I

    .line 46
    .line 47
    sget v15, Lcom/tencent/could/huiyansdk/R$string;->fl_too_many_faces:I

    .line 48
    .line 49
    sget v16, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_open_eye:I

    .line 50
    .line 51
    sget v17, Lcom/tencent/could/huiyansdk/R$string;->fl_close_mouth:I

    .line 52
    .line 53
    sget v19, Lcom/tencent/could/huiyansdk/R$string;->msg_fsm_pause:I

    .line 54
    .line 55
    move/from16 v18, v16

    .line 56
    .line 57
    filled-new-array/range {v3 .. v19}, [I

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->e:[I

    .line 62
    .line 63
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_blink:I

    .line 64
    .line 65
    sget v2, Lcom/tencent/could/huiyansdk/R$string;->fl_act_open_mouth:I

    .line 66
    .line 67
    sget v3, Lcom/tencent/could/huiyansdk/R$string;->fl_act_shake_head:I

    .line 68
    .line 69
    sget v4, Lcom/tencent/could/huiyansdk/R$string;->fl_act_nod_head:I

    .line 70
    .line 71
    sget v5, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_keep:I

    .line 72
    .line 73
    filled-new-array {v1, v2, v3, v4, v5}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->f:[I

    .line 78
    .line 79
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_screen_shaking:I

    .line 80
    .line 81
    filled-new-array {v1}, [I

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->g:[I

    .line 86
    .line 87
    sget v2, Lcom/tencent/could/huiyansdk/R$string;->rst_succeed:I

    .line 88
    .line 89
    sget v3, Lcom/tencent/could/huiyansdk/R$string;->rst_failed:I

    .line 90
    .line 91
    sget v4, Lcom/tencent/could/huiyansdk/R$string;->net_fetch_data:I

    .line 92
    .line 93
    sget v5, Lcom/tencent/could/huiyansdk/R$string;->net_fetch_failed:I

    .line 94
    .line 95
    sget v6, Lcom/tencent/could/huiyansdk/R$string;->net_reporting:I

    .line 96
    .line 97
    sget v7, Lcom/tencent/could/huiyansdk/R$string;->msg_net_error:I

    .line 98
    .line 99
    sget v8, Lcom/tencent/could/huiyansdk/R$string;->msg_param_error:I

    .line 100
    .line 101
    sget v9, Lcom/tencent/could/huiyansdk/R$string;->msg_inner_error:I

    .line 102
    .line 103
    sget v10, Lcom/tencent/could/huiyansdk/R$string;->msg_user_cancel:I

    .line 104
    .line 105
    sget v11, Lcom/tencent/could/huiyansdk/R$string;->msg_cam_error:I

    .line 106
    .line 107
    sget v12, Lcom/tencent/could/huiyansdk/R$string;->msg_light_dark:I

    .line 108
    .line 109
    sget v13, Lcom/tencent/could/huiyansdk/R$string;->msg_light_norm:I

    .line 110
    .line 111
    sget v14, Lcom/tencent/could/huiyansdk/R$string;->msg_light_bright:I

    .line 112
    .line 113
    filled-new-array/range {v2 .. v14}, [I

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->h:[I

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/b;->a()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/manager/b;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 216
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/could/huiyansdk/manager/b;->b(Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method private synthetic b(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/could/huiyansdk/manager/b;->a(Ljava/lang/String;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/SparseArray;

    .line 6
    .line 7
    const/16 v1, 0x14

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 13
    .line 14
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_open_mouth:I

    .line 15
    .line 16
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->ACT_OPEN_MOUTH:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 22
    .line 23
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_blink:I

    .line 24
    .line 25
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->ACT_BLINK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 31
    .line 32
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_nod_head:I

    .line 33
    .line 34
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->ACT_NOD_HEAD:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 40
    .line 41
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_shake_head:I

    .line 42
    .line 43
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->ACT_SHAKE_HEAD:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 49
    .line 50
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_act_screen_shaking:I

    .line 51
    .line 52
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->ACT_SCREEN_SHAKING:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 58
    .line 59
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_face:I

    .line 60
    .line 61
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_FACE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 67
    .line 68
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_left_face:I

    .line 69
    .line 70
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_LEFT_FACE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 71
    .line 72
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 76
    .line 77
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_right_face:I

    .line 78
    .line 79
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_RIGHT_FACE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 85
    .line 86
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_chin:I

    .line 87
    .line 88
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_CHIN:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 89
    .line 90
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 94
    .line 95
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_mouth:I

    .line 96
    .line 97
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_MOUTH:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 98
    .line 99
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 103
    .line 104
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_nose:I

    .line 105
    .line 106
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_NOSE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 112
    .line 113
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_left_eye:I

    .line 114
    .line 115
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_LEFT_EYE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 116
    .line 117
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 121
    .line 122
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_right_eye:I

    .line 123
    .line 124
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NO_RIGHT_EYE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 125
    .line 126
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 130
    .line 131
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_keep:I

    .line 132
    .line 133
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->POSE_KEEP:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 134
    .line 135
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 139
    .line 140
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_incomplete_face:I

    .line 141
    .line 142
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->INCOMPLETE_FACE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 143
    .line 144
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 148
    .line 149
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_closer:I

    .line 150
    .line 151
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->POSE_CLOSER:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 152
    .line 153
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 157
    .line 158
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_farer:I

    .line 159
    .line 160
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->POSE_FARTHER:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 161
    .line 162
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 166
    .line 167
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_incorrect:I

    .line 168
    .line 169
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->POSE_INCORRECT:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 170
    .line 171
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 175
    .line 176
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_too_many_faces:I

    .line 177
    .line 178
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->TOO_MANY_FACE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 179
    .line 180
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 184
    .line 185
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->fl_pose_open_eye:I

    .line 186
    .line 187
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->POSE_OPEN_EYE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 188
    .line 189
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 193
    .line 194
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->n:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 195
    .line 196
    return-void
.end method

.method public final a(I)V
    .locals 0

    .line 220
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    if-eqz p0, :cond_0

    .line 221
    check-cast p0, Lcom/tencent/could/huiyansdk/fragments/f;

    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/f;->b(I)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->a:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 218
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/b;->b:Lcom/tencent/could/huiyansdk/callback/a;

    if-eqz p0, :cond_0

    .line 219
    invoke-interface {p0, p1, p2}, Lcom/tencent/could/huiyansdk/callback/a;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 4

    .line 197
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, "do live compare result"

    const/4 v2, 0x2

    .line 198
    const-string v3, "AuthStateManager"

    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 199
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->l:Lcom/tencent/could/huiyansdk/manager/f;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const-string v1, ""

    .line 200
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Ljava/lang/String;ZLjava/lang/String;)V

    return-void

    .line 201
    :cond_0
    new-instance v1, Ll/ztq0;

    invoke-direct {v1, p0, p1}, Ll/ztq0;-><init>(Lcom/tencent/could/huiyansdk/manager/b;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/manager/f;->c(Lcom/tencent/could/huiyansdk/callback/e;)V

    return-void
.end method

.method public final a(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    .line 202
    sget-object v0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 203
    new-instance v1, Lcom/tencent/could/huiyansdk/manager/b$a;

    invoke-direct {v1, p0, p2, p1, p3}, Lcom/tencent/could/huiyansdk/manager/b$a;-><init>(Lcom/tencent/could/huiyansdk/manager/b;ZLjava/lang/String;Ljava/lang/String;)V

    .line 204
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    if-eqz p0, :cond_0

    .line 205
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->isNeedFrameCheck()Z

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-nez p0, :cond_1

    .line 206
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/b$a;->a()V

    return-void

    .line 207
    :cond_1
    iget-boolean p0, v0, Lcom/tencent/could/huiyansdk/turing/f;->e:Z

    if-eqz p0, :cond_2

    .line 208
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/b$a;->a()V

    return-void

    .line 209
    :cond_2
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->i:Lcom/tencent/could/huiyansdk/callback/d;

    .line 210
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    if-eqz p0, :cond_3

    .line 211
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p0

    const/4 p1, 0x4

    .line 212
    iput p1, p0, Landroid/os/Message;->what:I

    .line 213
    iget-object p1, v0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    iget-wide p2, v0, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    invoke-virtual {p1, p0, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    .line 214
    :cond_3
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string p1, "TuringSdkHelper"

    const-string p2, "waiting handler is null!"

    const/4 p3, 0x2

    .line 215
    invoke-virtual {p0, p3, p1, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final a(I[I)Z
    .locals 3

    .line 222
    array-length p0, p2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p0, :cond_1

    aget v2, p2, v1

    if-ne p1, v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method
